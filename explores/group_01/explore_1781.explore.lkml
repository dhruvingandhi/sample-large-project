# Explore: explore_1781
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05344.view.lkml"
include: "/views/domain_46/view_05346.view.lkml"
include: "/views/domain_47/view_05347.view.lkml"
include: "/views/domain_48/view_05348.view.lkml"

explore: explore_1781 {
  label: "Explore Explore 1781"
  description: "Comprehensive analytics explore joining base view_05344 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05344
  
  always_filter: {
    filters: [view_05344.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05344.created_at_date: "7 days"]
    unless: [view_05344.id, view_05344.status]
  }

  join: view_05346 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05344.user_id} = ${view_05346.id} ;;
    required_joins: []
  }

  join: view_05347 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05344.account_id} = ${view_05347.account_id} ;;
    required_joins: [view_05346]
  }

  join: view_05348 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05344.category} = ${view_05348.category} ;;
  }

  access_filter: {
    field: view_05344.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05344.is_deleted} = false ;;
}
