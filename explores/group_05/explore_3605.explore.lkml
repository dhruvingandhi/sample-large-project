# Update for 500 file diff target
# Explore: explore_3605
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10816.view.lkml"
include: "/views/domain_18/view_10818.view.lkml"
include: "/views/domain_19/view_10819.view.lkml"
include: "/views/domain_20/view_10820.view.lkml"

explore: explore_3605 {
  label: "Explore Explore 3605"
  description: "Comprehensive analytics explore joining base view_10816 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10816
  
  always_filter: {
    filters: [view_10816.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10816.created_at_date: "7 days"]
    unless: [view_10816.id, view_10816.status]
  }

  join: view_10818 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10816.user_id} = ${view_10818.id} ;;
    required_joins: []
  }

  join: view_10819 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10816.account_id} = ${view_10819.account_id} ;;
    required_joins: [view_10818]
  }

  join: view_10820 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10816.category} = ${view_10820.category} ;;
  }

  access_filter: {
    field: view_10816.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10816.is_deleted} = false ;;
}
