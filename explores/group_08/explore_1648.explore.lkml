# Explore: explore_1648
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04945.view.lkml"
include: "/views/domain_47/view_04947.view.lkml"
include: "/views/domain_48/view_04948.view.lkml"
include: "/views/domain_49/view_04949.view.lkml"

explore: explore_1648 {
  label: "Explore Explore 1648"
  description: "Comprehensive analytics explore joining base view_04945 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04945
  
  always_filter: {
    filters: [view_04945.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04945.created_at_date: "7 days"]
    unless: [view_04945.id, view_04945.status]
  }

  join: view_04947 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04945.user_id} = ${view_04947.id} ;;
    required_joins: []
  }

  join: view_04948 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04945.account_id} = ${view_04948.account_id} ;;
    required_joins: [view_04947]
  }

  join: view_04949 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04945.category} = ${view_04949.category} ;;
  }

  access_filter: {
    field: view_04945.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04945.is_deleted} = false ;;
}
