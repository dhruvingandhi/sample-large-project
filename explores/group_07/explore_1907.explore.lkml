# Explore: explore_1907
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05722.view.lkml"
include: "/views/domain_24/view_05724.view.lkml"
include: "/views/domain_25/view_05725.view.lkml"
include: "/views/domain_26/view_05726.view.lkml"

explore: explore_1907 {
  label: "Explore Explore 1907"
  description: "Comprehensive analytics explore joining base view_05722 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05722
  
  always_filter: {
    filters: [view_05722.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05722.created_at_date: "7 days"]
    unless: [view_05722.id, view_05722.status]
  }

  join: view_05724 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05722.user_id} = ${view_05724.id} ;;
    required_joins: []
  }

  join: view_05725 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05722.account_id} = ${view_05725.account_id} ;;
    required_joins: [view_05724]
  }

  join: view_05726 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05722.category} = ${view_05726.category} ;;
  }

  access_filter: {
    field: view_05722.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05722.is_deleted} = false ;;
}
