# Explore: explore_2688
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08065.view.lkml"
include: "/views/domain_17/view_08067.view.lkml"
include: "/views/domain_18/view_08068.view.lkml"
include: "/views/domain_19/view_08069.view.lkml"

explore: explore_2688 {
  label: "Explore Explore 2688"
  description: "Comprehensive analytics explore joining base view_08065 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08065
  
  always_filter: {
    filters: [view_08065.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08065.created_at_date: "7 days"]
    unless: [view_08065.id, view_08065.status]
  }

  join: view_08067 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08065.user_id} = ${view_08067.id} ;;
    required_joins: []
  }

  join: view_08068 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08065.account_id} = ${view_08068.account_id} ;;
    required_joins: [view_08067]
  }

  join: view_08069 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08065.category} = ${view_08069.category} ;;
  }

  access_filter: {
    field: view_08065.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08065.is_deleted} = false ;;
}
