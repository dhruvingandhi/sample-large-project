# Explore: explore_3363
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10090.view.lkml"
include: "/views/domain_42/view_10092.view.lkml"
include: "/views/domain_43/view_10093.view.lkml"
include: "/views/domain_44/view_10094.view.lkml"

explore: explore_3363 {
  label: "Explore Explore 3363"
  description: "Comprehensive analytics explore joining base view_10090 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10090
  
  always_filter: {
    filters: [view_10090.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10090.created_at_date: "7 days"]
    unless: [view_10090.id, view_10090.status]
  }

  join: view_10092 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10090.user_id} = ${view_10092.id} ;;
    required_joins: []
  }

  join: view_10093 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10090.account_id} = ${view_10093.account_id} ;;
    required_joins: [view_10092]
  }

  join: view_10094 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10090.category} = ${view_10094.category} ;;
  }

  access_filter: {
    field: view_10090.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10090.is_deleted} = false ;;
}
