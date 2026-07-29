# Explore: explore_0721
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02164.view.lkml"
include: "/views/domain_16/view_02166.view.lkml"
include: "/views/domain_17/view_02167.view.lkml"
include: "/views/domain_18/view_02168.view.lkml"

explore: explore_0721 {
  label: "Explore Explore 0721"
  description: "Comprehensive analytics explore joining base view_02164 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02164
  
  always_filter: {
    filters: [view_02164.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02164.created_at_date: "7 days"]
    unless: [view_02164.id, view_02164.status]
  }

  join: view_02166 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02164.user_id} = ${view_02166.id} ;;
    required_joins: []
  }

  join: view_02167 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02164.account_id} = ${view_02167.account_id} ;;
    required_joins: [view_02166]
  }

  join: view_02168 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02164.category} = ${view_02168.category} ;;
  }

  access_filter: {
    field: view_02164.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02164.is_deleted} = false ;;
}
