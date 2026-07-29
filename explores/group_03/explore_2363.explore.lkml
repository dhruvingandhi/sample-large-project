# Explore: explore_2363
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07090.view.lkml"
include: "/views/domain_42/view_07092.view.lkml"
include: "/views/domain_43/view_07093.view.lkml"
include: "/views/domain_44/view_07094.view.lkml"

explore: explore_2363 {
  label: "Explore Explore 2363"
  description: "Comprehensive analytics explore joining base view_07090 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07090
  
  always_filter: {
    filters: [view_07090.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07090.created_at_date: "7 days"]
    unless: [view_07090.id, view_07090.status]
  }

  join: view_07092 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07090.user_id} = ${view_07092.id} ;;
    required_joins: []
  }

  join: view_07093 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07090.account_id} = ${view_07093.account_id} ;;
    required_joins: [view_07092]
  }

  join: view_07094 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07090.category} = ${view_07094.category} ;;
  }

  access_filter: {
    field: view_07090.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07090.is_deleted} = false ;;
}
