# Explore: explore_0750
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02251.view.lkml"
include: "/views/domain_03/view_02253.view.lkml"
include: "/views/domain_04/view_02254.view.lkml"
include: "/views/domain_05/view_02255.view.lkml"

explore: explore_0750 {
  label: "Explore Explore 0750"
  description: "Comprehensive analytics explore joining base view_02251 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02251
  
  always_filter: {
    filters: [view_02251.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02251.created_at_date: "7 days"]
    unless: [view_02251.id, view_02251.status]
  }

  join: view_02253 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02251.user_id} = ${view_02253.id} ;;
    required_joins: []
  }

  join: view_02254 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02251.account_id} = ${view_02254.account_id} ;;
    required_joins: [view_02253]
  }

  join: view_02255 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02251.category} = ${view_02255.category} ;;
  }

  access_filter: {
    field: view_02251.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02251.is_deleted} = false ;;
}
