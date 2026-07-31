# Update for 2000 file diff target
# Explore: explore_1760
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05281.view.lkml"
include: "/views/domain_33/view_05283.view.lkml"
include: "/views/domain_34/view_05284.view.lkml"
include: "/views/domain_35/view_05285.view.lkml"

explore: explore_1760 {
  label: "Explore Explore 1760"
  description: "Comprehensive analytics explore joining base view_05281 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05281
  
  always_filter: {
    filters: [view_05281.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05281.created_at_date: "7 days"]
    unless: [view_05281.id, view_05281.status]
  }

  join: view_05283 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05281.user_id} = ${view_05283.id} ;;
    required_joins: []
  }

  join: view_05284 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05281.account_id} = ${view_05284.account_id} ;;
    required_joins: [view_05283]
  }

  join: view_05285 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05281.category} = ${view_05285.category} ;;
  }

  access_filter: {
    field: view_05281.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05281.is_deleted} = false ;;
}
