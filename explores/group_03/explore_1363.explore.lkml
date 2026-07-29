# Explore: explore_1363
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04090.view.lkml"
include: "/views/domain_42/view_04092.view.lkml"
include: "/views/domain_43/view_04093.view.lkml"
include: "/views/domain_44/view_04094.view.lkml"

explore: explore_1363 {
  label: "Explore Explore 1363"
  description: "Comprehensive analytics explore joining base view_04090 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04090
  
  always_filter: {
    filters: [view_04090.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04090.created_at_date: "7 days"]
    unless: [view_04090.id, view_04090.status]
  }

  join: view_04092 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04090.user_id} = ${view_04092.id} ;;
    required_joins: []
  }

  join: view_04093 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04090.account_id} = ${view_04093.account_id} ;;
    required_joins: [view_04092]
  }

  join: view_04094 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04090.category} = ${view_04094.category} ;;
  }

  access_filter: {
    field: view_04090.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04090.is_deleted} = false ;;
}
