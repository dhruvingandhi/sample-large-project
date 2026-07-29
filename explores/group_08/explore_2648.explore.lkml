# Explore: explore_2648
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07945.view.lkml"
include: "/views/domain_47/view_07947.view.lkml"
include: "/views/domain_48/view_07948.view.lkml"
include: "/views/domain_49/view_07949.view.lkml"

explore: explore_2648 {
  label: "Explore Explore 2648"
  description: "Comprehensive analytics explore joining base view_07945 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07945
  
  always_filter: {
    filters: [view_07945.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07945.created_at_date: "7 days"]
    unless: [view_07945.id, view_07945.status]
  }

  join: view_07947 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07945.user_id} = ${view_07947.id} ;;
    required_joins: []
  }

  join: view_07948 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07945.account_id} = ${view_07948.account_id} ;;
    required_joins: [view_07947]
  }

  join: view_07949 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07945.category} = ${view_07949.category} ;;
  }

  access_filter: {
    field: view_07945.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07945.is_deleted} = false ;;
}
