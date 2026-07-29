# Explore: explore_3290
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09871.view.lkml"
include: "/views/domain_23/view_09873.view.lkml"
include: "/views/domain_24/view_09874.view.lkml"
include: "/views/domain_25/view_09875.view.lkml"

explore: explore_3290 {
  label: "Explore Explore 3290"
  description: "Comprehensive analytics explore joining base view_09871 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09871
  
  always_filter: {
    filters: [view_09871.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09871.created_at_date: "7 days"]
    unless: [view_09871.id, view_09871.status]
  }

  join: view_09873 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09871.user_id} = ${view_09873.id} ;;
    required_joins: []
  }

  join: view_09874 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09871.account_id} = ${view_09874.account_id} ;;
    required_joins: [view_09873]
  }

  join: view_09875 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09871.category} = ${view_09875.category} ;;
  }

  access_filter: {
    field: view_09871.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09871.is_deleted} = false ;;
}
