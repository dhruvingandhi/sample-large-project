# Explore: explore_3241
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09724.view.lkml"
include: "/views/domain_26/view_09726.view.lkml"
include: "/views/domain_27/view_09727.view.lkml"
include: "/views/domain_28/view_09728.view.lkml"

explore: explore_3241 {
  label: "Explore Explore 3241"
  description: "Comprehensive analytics explore joining base view_09724 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09724
  
  always_filter: {
    filters: [view_09724.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09724.created_at_date: "7 days"]
    unless: [view_09724.id, view_09724.status]
  }

  join: view_09726 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09724.user_id} = ${view_09726.id} ;;
    required_joins: []
  }

  join: view_09727 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09724.account_id} = ${view_09727.account_id} ;;
    required_joins: [view_09726]
  }

  join: view_09728 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09724.category} = ${view_09728.category} ;;
  }

  access_filter: {
    field: view_09724.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09724.is_deleted} = false ;;
}
