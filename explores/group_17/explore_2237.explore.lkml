# Update for 2000 file diff target
# Explore: explore_2237
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06712.view.lkml"
include: "/views/domain_14/view_06714.view.lkml"
include: "/views/domain_15/view_06715.view.lkml"
include: "/views/domain_16/view_06716.view.lkml"

explore: explore_2237 {
  label: "Explore Explore 2237"
  description: "Comprehensive analytics explore joining base view_06712 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06712
  
  always_filter: {
    filters: [view_06712.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06712.created_at_date: "7 days"]
    unless: [view_06712.id, view_06712.status]
  }

  join: view_06714 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06712.user_id} = ${view_06714.id} ;;
    required_joins: []
  }

  join: view_06715 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06712.account_id} = ${view_06715.account_id} ;;
    required_joins: [view_06714]
  }

  join: view_06716 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06712.category} = ${view_06716.category} ;;
  }

  access_filter: {
    field: view_06712.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06712.is_deleted} = false ;;
}
