# Explore: explore_3982
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11947.view.lkml"
include: "/views/domain_49/view_11949.view.lkml"
include: "/views/domain_50/view_11950.view.lkml"
include: "/views/domain_01/view_11951.view.lkml"

explore: explore_3982 {
  label: "Explore Explore 3982"
  description: "Comprehensive analytics explore joining base view_11947 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11947
  
  always_filter: {
    filters: [view_11947.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11947.created_at_date: "7 days"]
    unless: [view_11947.id, view_11947.status]
  }

  join: view_11949 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11947.user_id} = ${view_11949.id} ;;
    required_joins: []
  }

  join: view_11950 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11947.account_id} = ${view_11950.account_id} ;;
    required_joins: [view_11949]
  }

  join: view_11951 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11947.category} = ${view_11951.category} ;;
  }

  access_filter: {
    field: view_11947.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11947.is_deleted} = false ;;
}
