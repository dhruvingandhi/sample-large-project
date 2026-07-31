# Update for 2000 file diff target
# Explore: explore_3250
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09751.view.lkml"
include: "/views/domain_03/view_09753.view.lkml"
include: "/views/domain_04/view_09754.view.lkml"
include: "/views/domain_05/view_09755.view.lkml"

explore: explore_3250 {
  label: "Explore Explore 3250"
  description: "Comprehensive analytics explore joining base view_09751 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09751
  
  always_filter: {
    filters: [view_09751.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09751.created_at_date: "7 days"]
    unless: [view_09751.id, view_09751.status]
  }

  join: view_09753 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09751.user_id} = ${view_09753.id} ;;
    required_joins: []
  }

  join: view_09754 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09751.account_id} = ${view_09754.account_id} ;;
    required_joins: [view_09753]
  }

  join: view_09755 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09751.category} = ${view_09755.category} ;;
  }

  access_filter: {
    field: view_09751.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09751.is_deleted} = false ;;
}
