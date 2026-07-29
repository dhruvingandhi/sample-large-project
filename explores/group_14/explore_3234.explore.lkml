# Explore: explore_3234
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09703.view.lkml"
include: "/views/domain_05/view_09705.view.lkml"
include: "/views/domain_06/view_09706.view.lkml"
include: "/views/domain_07/view_09707.view.lkml"

explore: explore_3234 {
  label: "Explore Explore 3234"
  description: "Comprehensive analytics explore joining base view_09703 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09703
  
  always_filter: {
    filters: [view_09703.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09703.created_at_date: "7 days"]
    unless: [view_09703.id, view_09703.status]
  }

  join: view_09705 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09703.user_id} = ${view_09705.id} ;;
    required_joins: []
  }

  join: view_09706 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09703.account_id} = ${view_09706.account_id} ;;
    required_joins: [view_09705]
  }

  join: view_09707 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09703.category} = ${view_09707.category} ;;
  }

  access_filter: {
    field: view_09703.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09703.is_deleted} = false ;;
}
