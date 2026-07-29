# Explore: explore_2710
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08131.view.lkml"
include: "/views/domain_33/view_08133.view.lkml"
include: "/views/domain_34/view_08134.view.lkml"
include: "/views/domain_35/view_08135.view.lkml"

explore: explore_2710 {
  label: "Explore Explore 2710"
  description: "Comprehensive analytics explore joining base view_08131 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08131
  
  always_filter: {
    filters: [view_08131.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08131.created_at_date: "7 days"]
    unless: [view_08131.id, view_08131.status]
  }

  join: view_08133 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08131.user_id} = ${view_08133.id} ;;
    required_joins: []
  }

  join: view_08134 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08131.account_id} = ${view_08134.account_id} ;;
    required_joins: [view_08133]
  }

  join: view_08135 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08131.category} = ${view_08135.category} ;;
  }

  access_filter: {
    field: view_08131.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08131.is_deleted} = false ;;
}
