# Explore: explore_2241
# Auto-generated LookML Explore File

include: "/views/domain_24/view_06724.view.lkml"
include: "/views/domain_26/view_06726.view.lkml"
include: "/views/domain_27/view_06727.view.lkml"
include: "/views/domain_28/view_06728.view.lkml"

explore: explore_2241 {
  label: "Explore Explore 2241"
  description: "Comprehensive analytics explore joining base view_06724 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06724
  
  always_filter: {
    filters: [view_06724.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06724.created_at_date: "7 days"]
    unless: [view_06724.id, view_06724.status]
  }

  join: view_06726 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06724.user_id} = ${view_06726.id} ;;
    required_joins: []
  }

  join: view_06727 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06724.account_id} = ${view_06727.account_id} ;;
    required_joins: [view_06726]
  }

  join: view_06728 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06724.category} = ${view_06728.category} ;;
  }

  access_filter: {
    field: view_06724.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06724.is_deleted} = false ;;
}
