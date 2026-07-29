# Explore: explore_1280
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03841.view.lkml"
include: "/views/domain_43/view_03843.view.lkml"
include: "/views/domain_44/view_03844.view.lkml"
include: "/views/domain_45/view_03845.view.lkml"

explore: explore_1280 {
  label: "Explore Explore 1280"
  description: "Comprehensive analytics explore joining base view_03841 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03841
  
  always_filter: {
    filters: [view_03841.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03841.created_at_date: "7 days"]
    unless: [view_03841.id, view_03841.status]
  }

  join: view_03843 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03841.user_id} = ${view_03843.id} ;;
    required_joins: []
  }

  join: view_03844 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03841.account_id} = ${view_03844.account_id} ;;
    required_joins: [view_03843]
  }

  join: view_03845 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03841.category} = ${view_03845.category} ;;
  }

  access_filter: {
    field: view_03841.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03841.is_deleted} = false ;;
}
