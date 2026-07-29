# Explore: explore_3116
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09349.view.lkml"
include: "/views/domain_01/view_09351.view.lkml"
include: "/views/domain_02/view_09352.view.lkml"
include: "/views/domain_03/view_09353.view.lkml"

explore: explore_3116 {
  label: "Explore Explore 3116"
  description: "Comprehensive analytics explore joining base view_09349 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09349
  
  always_filter: {
    filters: [view_09349.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09349.created_at_date: "7 days"]
    unless: [view_09349.id, view_09349.status]
  }

  join: view_09351 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09349.user_id} = ${view_09351.id} ;;
    required_joins: []
  }

  join: view_09352 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09349.account_id} = ${view_09352.account_id} ;;
    required_joins: [view_09351]
  }

  join: view_09353 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09349.category} = ${view_09353.category} ;;
  }

  access_filter: {
    field: view_09349.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09349.is_deleted} = false ;;
}
