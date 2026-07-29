# Explore: explore_3915
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11746.view.lkml"
include: "/views/domain_48/view_11748.view.lkml"
include: "/views/domain_49/view_11749.view.lkml"
include: "/views/domain_50/view_11750.view.lkml"

explore: explore_3915 {
  label: "Explore Explore 3915"
  description: "Comprehensive analytics explore joining base view_11746 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11746
  
  always_filter: {
    filters: [view_11746.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11746.created_at_date: "7 days"]
    unless: [view_11746.id, view_11746.status]
  }

  join: view_11748 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11746.user_id} = ${view_11748.id} ;;
    required_joins: []
  }

  join: view_11749 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11746.account_id} = ${view_11749.account_id} ;;
    required_joins: [view_11748]
  }

  join: view_11750 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11746.category} = ${view_11750.category} ;;
  }

  access_filter: {
    field: view_11746.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11746.is_deleted} = false ;;
}
