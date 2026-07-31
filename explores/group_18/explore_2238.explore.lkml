# Update for 2000 file diff target
# Explore: explore_2238
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06715.view.lkml"
include: "/views/domain_17/view_06717.view.lkml"
include: "/views/domain_18/view_06718.view.lkml"
include: "/views/domain_19/view_06719.view.lkml"

explore: explore_2238 {
  label: "Explore Explore 2238"
  description: "Comprehensive analytics explore joining base view_06715 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06715
  
  always_filter: {
    filters: [view_06715.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06715.created_at_date: "7 days"]
    unless: [view_06715.id, view_06715.status]
  }

  join: view_06717 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06715.user_id} = ${view_06717.id} ;;
    required_joins: []
  }

  join: view_06718 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06715.account_id} = ${view_06718.account_id} ;;
    required_joins: [view_06717]
  }

  join: view_06719 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06715.category} = ${view_06719.category} ;;
  }

  access_filter: {
    field: view_06715.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06715.is_deleted} = false ;;
}
