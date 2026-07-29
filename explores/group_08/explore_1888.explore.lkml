# Explore: explore_1888
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05665.view.lkml"
include: "/views/domain_17/view_05667.view.lkml"
include: "/views/domain_18/view_05668.view.lkml"
include: "/views/domain_19/view_05669.view.lkml"

explore: explore_1888 {
  label: "Explore Explore 1888"
  description: "Comprehensive analytics explore joining base view_05665 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05665
  
  always_filter: {
    filters: [view_05665.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05665.created_at_date: "7 days"]
    unless: [view_05665.id, view_05665.status]
  }

  join: view_05667 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05665.user_id} = ${view_05667.id} ;;
    required_joins: []
  }

  join: view_05668 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05665.account_id} = ${view_05668.account_id} ;;
    required_joins: [view_05667]
  }

  join: view_05669 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05665.category} = ${view_05669.category} ;;
  }

  access_filter: {
    field: view_05665.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05665.is_deleted} = false ;;
}
