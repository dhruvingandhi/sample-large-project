# Explore: explore_2290
# Auto-generated LookML Explore File

include: "/views/domain_21/view_06871.view.lkml"
include: "/views/domain_23/view_06873.view.lkml"
include: "/views/domain_24/view_06874.view.lkml"
include: "/views/domain_25/view_06875.view.lkml"

explore: explore_2290 {
  label: "Explore Explore 2290"
  description: "Comprehensive analytics explore joining base view_06871 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06871
  
  always_filter: {
    filters: [view_06871.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06871.created_at_date: "7 days"]
    unless: [view_06871.id, view_06871.status]
  }

  join: view_06873 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06871.user_id} = ${view_06873.id} ;;
    required_joins: []
  }

  join: view_06874 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06871.account_id} = ${view_06874.account_id} ;;
    required_joins: [view_06873]
  }

  join: view_06875 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06871.category} = ${view_06875.category} ;;
  }

  access_filter: {
    field: view_06871.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06871.is_deleted} = false ;;
}
