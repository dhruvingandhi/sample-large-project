# Explore: explore_2687
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08062.view.lkml"
include: "/views/domain_14/view_08064.view.lkml"
include: "/views/domain_15/view_08065.view.lkml"
include: "/views/domain_16/view_08066.view.lkml"

explore: explore_2687 {
  label: "Explore Explore 2687"
  description: "Comprehensive analytics explore joining base view_08062 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08062
  
  always_filter: {
    filters: [view_08062.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08062.created_at_date: "7 days"]
    unless: [view_08062.id, view_08062.status]
  }

  join: view_08064 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08062.user_id} = ${view_08064.id} ;;
    required_joins: []
  }

  join: view_08065 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08062.account_id} = ${view_08065.account_id} ;;
    required_joins: [view_08064]
  }

  join: view_08066 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08062.category} = ${view_08066.category} ;;
  }

  access_filter: {
    field: view_08062.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08062.is_deleted} = false ;;
}
