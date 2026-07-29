# Explore: explore_1906
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05719.view.lkml"
include: "/views/domain_21/view_05721.view.lkml"
include: "/views/domain_22/view_05722.view.lkml"
include: "/views/domain_23/view_05723.view.lkml"

explore: explore_1906 {
  label: "Explore Explore 1906"
  description: "Comprehensive analytics explore joining base view_05719 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05719
  
  always_filter: {
    filters: [view_05719.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05719.created_at_date: "7 days"]
    unless: [view_05719.id, view_05719.status]
  }

  join: view_05721 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05719.user_id} = ${view_05721.id} ;;
    required_joins: []
  }

  join: view_05722 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05719.account_id} = ${view_05722.account_id} ;;
    required_joins: [view_05721]
  }

  join: view_05723 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05719.category} = ${view_05723.category} ;;
  }

  access_filter: {
    field: view_05719.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05719.is_deleted} = false ;;
}
