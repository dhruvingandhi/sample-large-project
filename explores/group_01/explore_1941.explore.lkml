# Explore: explore_1941
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05824.view.lkml"
include: "/views/domain_26/view_05826.view.lkml"
include: "/views/domain_27/view_05827.view.lkml"
include: "/views/domain_28/view_05828.view.lkml"

explore: explore_1941 {
  label: "Explore Explore 1941"
  description: "Comprehensive analytics explore joining base view_05824 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05824
  
  always_filter: {
    filters: [view_05824.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05824.created_at_date: "7 days"]
    unless: [view_05824.id, view_05824.status]
  }

  join: view_05826 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05824.user_id} = ${view_05826.id} ;;
    required_joins: []
  }

  join: view_05827 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05824.account_id} = ${view_05827.account_id} ;;
    required_joins: [view_05826]
  }

  join: view_05828 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05824.category} = ${view_05828.category} ;;
  }

  access_filter: {
    field: view_05824.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05824.is_deleted} = false ;;
}
