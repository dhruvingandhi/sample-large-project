# Update for 2000 file diff target
# Explore: explore_3238
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09715.view.lkml"
include: "/views/domain_17/view_09717.view.lkml"
include: "/views/domain_18/view_09718.view.lkml"
include: "/views/domain_19/view_09719.view.lkml"

explore: explore_3238 {
  label: "Explore Explore 3238"
  description: "Comprehensive analytics explore joining base view_09715 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09715
  
  always_filter: {
    filters: [view_09715.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09715.created_at_date: "7 days"]
    unless: [view_09715.id, view_09715.status]
  }

  join: view_09717 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09715.user_id} = ${view_09717.id} ;;
    required_joins: []
  }

  join: view_09718 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09715.account_id} = ${view_09718.account_id} ;;
    required_joins: [view_09717]
  }

  join: view_09719 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09715.category} = ${view_09719.category} ;;
  }

  access_filter: {
    field: view_09715.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09715.is_deleted} = false ;;
}
