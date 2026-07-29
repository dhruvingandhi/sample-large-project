# Explore: explore_1813
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05440.view.lkml"
include: "/views/domain_42/view_05442.view.lkml"
include: "/views/domain_43/view_05443.view.lkml"
include: "/views/domain_44/view_05444.view.lkml"

explore: explore_1813 {
  label: "Explore Explore 1813"
  description: "Comprehensive analytics explore joining base view_05440 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05440
  
  always_filter: {
    filters: [view_05440.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05440.created_at_date: "7 days"]
    unless: [view_05440.id, view_05440.status]
  }

  join: view_05442 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05440.user_id} = ${view_05442.id} ;;
    required_joins: []
  }

  join: view_05443 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05440.account_id} = ${view_05443.account_id} ;;
    required_joins: [view_05442]
  }

  join: view_05444 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05440.category} = ${view_05444.category} ;;
  }

  access_filter: {
    field: view_05440.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05440.is_deleted} = false ;;
}
