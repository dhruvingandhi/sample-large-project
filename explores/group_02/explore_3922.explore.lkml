# Explore: explore_3922
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11767.view.lkml"
include: "/views/domain_19/view_11769.view.lkml"
include: "/views/domain_20/view_11770.view.lkml"
include: "/views/domain_21/view_11771.view.lkml"

explore: explore_3922 {
  label: "Explore Explore 3922"
  description: "Comprehensive analytics explore joining base view_11767 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11767
  
  always_filter: {
    filters: [view_11767.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11767.created_at_date: "7 days"]
    unless: [view_11767.id, view_11767.status]
  }

  join: view_11769 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11767.user_id} = ${view_11769.id} ;;
    required_joins: []
  }

  join: view_11770 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11767.account_id} = ${view_11770.account_id} ;;
    required_joins: [view_11769]
  }

  join: view_11771 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11767.category} = ${view_11771.category} ;;
  }

  access_filter: {
    field: view_11767.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11767.is_deleted} = false ;;
}
