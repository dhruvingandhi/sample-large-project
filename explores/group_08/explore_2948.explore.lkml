# Explore: explore_2948
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08845.view.lkml"
include: "/views/domain_47/view_08847.view.lkml"
include: "/views/domain_48/view_08848.view.lkml"
include: "/views/domain_49/view_08849.view.lkml"

explore: explore_2948 {
  label: "Explore Explore 2948"
  description: "Comprehensive analytics explore joining base view_08845 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08845
  
  always_filter: {
    filters: [view_08845.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08845.created_at_date: "7 days"]
    unless: [view_08845.id, view_08845.status]
  }

  join: view_08847 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08845.user_id} = ${view_08847.id} ;;
    required_joins: []
  }

  join: view_08848 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08845.account_id} = ${view_08848.account_id} ;;
    required_joins: [view_08847]
  }

  join: view_08849 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08845.category} = ${view_08849.category} ;;
  }

  access_filter: {
    field: view_08845.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08845.is_deleted} = false ;;
}
