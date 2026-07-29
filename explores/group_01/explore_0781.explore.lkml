# Explore: explore_0781
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02344.view.lkml"
include: "/views/domain_46/view_02346.view.lkml"
include: "/views/domain_47/view_02347.view.lkml"
include: "/views/domain_48/view_02348.view.lkml"

explore: explore_0781 {
  label: "Explore Explore 0781"
  description: "Comprehensive analytics explore joining base view_02344 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02344
  
  always_filter: {
    filters: [view_02344.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02344.created_at_date: "7 days"]
    unless: [view_02344.id, view_02344.status]
  }

  join: view_02346 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02344.user_id} = ${view_02346.id} ;;
    required_joins: []
  }

  join: view_02347 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02344.account_id} = ${view_02347.account_id} ;;
    required_joins: [view_02346]
  }

  join: view_02348 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02344.category} = ${view_02348.category} ;;
  }

  access_filter: {
    field: view_02344.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02344.is_deleted} = false ;;
}
