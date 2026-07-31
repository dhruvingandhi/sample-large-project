# Update for 2000 file diff target
# Explore: explore_1238
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03715.view.lkml"
include: "/views/domain_17/view_03717.view.lkml"
include: "/views/domain_18/view_03718.view.lkml"
include: "/views/domain_19/view_03719.view.lkml"

explore: explore_1238 {
  label: "Explore Explore 1238"
  description: "Comprehensive analytics explore joining base view_03715 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03715
  
  always_filter: {
    filters: [view_03715.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03715.created_at_date: "7 days"]
    unless: [view_03715.id, view_03715.status]
  }

  join: view_03717 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03715.user_id} = ${view_03717.id} ;;
    required_joins: []
  }

  join: view_03718 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03715.account_id} = ${view_03718.account_id} ;;
    required_joins: [view_03717]
  }

  join: view_03719 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03715.category} = ${view_03719.category} ;;
  }

  access_filter: {
    field: view_03715.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03715.is_deleted} = false ;;
}
