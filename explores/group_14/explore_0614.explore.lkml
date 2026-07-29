# Explore: explore_0614
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01843.view.lkml"
include: "/views/domain_45/view_01845.view.lkml"
include: "/views/domain_46/view_01846.view.lkml"
include: "/views/domain_47/view_01847.view.lkml"

explore: explore_0614 {
  label: "Explore Explore 0614"
  description: "Comprehensive analytics explore joining base view_01843 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01843
  
  always_filter: {
    filters: [view_01843.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01843.created_at_date: "7 days"]
    unless: [view_01843.id, view_01843.status]
  }

  join: view_01845 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01843.user_id} = ${view_01845.id} ;;
    required_joins: []
  }

  join: view_01846 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01843.account_id} = ${view_01846.account_id} ;;
    required_joins: [view_01845]
  }

  join: view_01847 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01843.category} = ${view_01847.category} ;;
  }

  access_filter: {
    field: view_01843.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01843.is_deleted} = false ;;
}
