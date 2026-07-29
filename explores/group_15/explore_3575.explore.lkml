# Explore: explore_3575
# Auto-generated LookML Explore File

include: "/views/domain_26/view_10726.view.lkml"
include: "/views/domain_28/view_10728.view.lkml"
include: "/views/domain_29/view_10729.view.lkml"
include: "/views/domain_30/view_10730.view.lkml"

explore: explore_3575 {
  label: "Explore Explore 3575"
  description: "Comprehensive analytics explore joining base view_10726 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10726
  
  always_filter: {
    filters: [view_10726.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10726.created_at_date: "7 days"]
    unless: [view_10726.id, view_10726.status]
  }

  join: view_10728 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10726.user_id} = ${view_10728.id} ;;
    required_joins: []
  }

  join: view_10729 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10726.account_id} = ${view_10729.account_id} ;;
    required_joins: [view_10728]
  }

  join: view_10730 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10726.category} = ${view_10730.category} ;;
  }

  access_filter: {
    field: view_10726.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10726.is_deleted} = false ;;
}
