# Explore: explore_2922
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08767.view.lkml"
include: "/views/domain_19/view_08769.view.lkml"
include: "/views/domain_20/view_08770.view.lkml"
include: "/views/domain_21/view_08771.view.lkml"

explore: explore_2922 {
  label: "Explore Explore 2922"
  description: "Comprehensive analytics explore joining base view_08767 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08767
  
  always_filter: {
    filters: [view_08767.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08767.created_at_date: "7 days"]
    unless: [view_08767.id, view_08767.status]
  }

  join: view_08769 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08767.user_id} = ${view_08769.id} ;;
    required_joins: []
  }

  join: view_08770 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08767.account_id} = ${view_08770.account_id} ;;
    required_joins: [view_08769]
  }

  join: view_08771 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08767.category} = ${view_08771.category} ;;
  }

  access_filter: {
    field: view_08767.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08767.is_deleted} = false ;;
}
