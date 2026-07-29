# Explore: explore_3106
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09319.view.lkml"
include: "/views/domain_21/view_09321.view.lkml"
include: "/views/domain_22/view_09322.view.lkml"
include: "/views/domain_23/view_09323.view.lkml"

explore: explore_3106 {
  label: "Explore Explore 3106"
  description: "Comprehensive analytics explore joining base view_09319 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09319
  
  always_filter: {
    filters: [view_09319.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09319.created_at_date: "7 days"]
    unless: [view_09319.id, view_09319.status]
  }

  join: view_09321 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09319.user_id} = ${view_09321.id} ;;
    required_joins: []
  }

  join: view_09322 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09319.account_id} = ${view_09322.account_id} ;;
    required_joins: [view_09321]
  }

  join: view_09323 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09319.category} = ${view_09323.category} ;;
  }

  access_filter: {
    field: view_09319.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09319.is_deleted} = false ;;
}
