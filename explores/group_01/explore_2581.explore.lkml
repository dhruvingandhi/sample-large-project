# Explore: explore_2581
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07744.view.lkml"
include: "/views/domain_46/view_07746.view.lkml"
include: "/views/domain_47/view_07747.view.lkml"
include: "/views/domain_48/view_07748.view.lkml"

explore: explore_2581 {
  label: "Explore Explore 2581"
  description: "Comprehensive analytics explore joining base view_07744 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07744
  
  always_filter: {
    filters: [view_07744.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07744.created_at_date: "7 days"]
    unless: [view_07744.id, view_07744.status]
  }

  join: view_07746 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07744.user_id} = ${view_07746.id} ;;
    required_joins: []
  }

  join: view_07747 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07744.account_id} = ${view_07747.account_id} ;;
    required_joins: [view_07746]
  }

  join: view_07748 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07744.category} = ${view_07748.category} ;;
  }

  access_filter: {
    field: view_07744.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07744.is_deleted} = false ;;
}
