# Explore: explore_3695
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11086.view.lkml"
include: "/views/domain_38/view_11088.view.lkml"
include: "/views/domain_39/view_11089.view.lkml"
include: "/views/domain_40/view_11090.view.lkml"

explore: explore_3695 {
  label: "Explore Explore 3695"
  description: "Comprehensive analytics explore joining base view_11086 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11086
  
  always_filter: {
    filters: [view_11086.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11086.created_at_date: "7 days"]
    unless: [view_11086.id, view_11086.status]
  }

  join: view_11088 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11086.user_id} = ${view_11088.id} ;;
    required_joins: []
  }

  join: view_11089 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11086.account_id} = ${view_11089.account_id} ;;
    required_joins: [view_11088]
  }

  join: view_11090 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11086.category} = ${view_11090.category} ;;
  }

  access_filter: {
    field: view_11086.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11086.is_deleted} = false ;;
}
