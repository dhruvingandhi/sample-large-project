# Explore: explore_2315
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06946.view.lkml"
include: "/views/domain_48/view_06948.view.lkml"
include: "/views/domain_49/view_06949.view.lkml"
include: "/views/domain_50/view_06950.view.lkml"

explore: explore_2315 {
  label: "Explore Explore 2315"
  description: "Comprehensive analytics explore joining base view_06946 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06946
  
  always_filter: {
    filters: [view_06946.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06946.created_at_date: "7 days"]
    unless: [view_06946.id, view_06946.status]
  }

  join: view_06948 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06946.user_id} = ${view_06948.id} ;;
    required_joins: []
  }

  join: view_06949 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06946.account_id} = ${view_06949.account_id} ;;
    required_joins: [view_06948]
  }

  join: view_06950 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06946.category} = ${view_06950.category} ;;
  }

  access_filter: {
    field: view_06946.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06946.is_deleted} = false ;;
}
