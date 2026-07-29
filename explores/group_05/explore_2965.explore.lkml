# Explore: explore_2965
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08896.view.lkml"
include: "/views/domain_48/view_08898.view.lkml"
include: "/views/domain_49/view_08899.view.lkml"
include: "/views/domain_50/view_08900.view.lkml"

explore: explore_2965 {
  label: "Explore Explore 2965"
  description: "Comprehensive analytics explore joining base view_08896 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08896
  
  always_filter: {
    filters: [view_08896.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08896.created_at_date: "7 days"]
    unless: [view_08896.id, view_08896.status]
  }

  join: view_08898 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08896.user_id} = ${view_08898.id} ;;
    required_joins: []
  }

  join: view_08899 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08896.account_id} = ${view_08899.account_id} ;;
    required_joins: [view_08898]
  }

  join: view_08900 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08896.category} = ${view_08900.category} ;;
  }

  access_filter: {
    field: view_08896.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08896.is_deleted} = false ;;
}
