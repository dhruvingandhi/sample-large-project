# Explore: explore_0591
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01774.view.lkml"
include: "/views/domain_26/view_01776.view.lkml"
include: "/views/domain_27/view_01777.view.lkml"
include: "/views/domain_28/view_01778.view.lkml"

explore: explore_0591 {
  label: "Explore Explore 0591"
  description: "Comprehensive analytics explore joining base view_01774 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01774
  
  always_filter: {
    filters: [view_01774.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01774.created_at_date: "7 days"]
    unless: [view_01774.id, view_01774.status]
  }

  join: view_01776 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01774.user_id} = ${view_01776.id} ;;
    required_joins: []
  }

  join: view_01777 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01774.account_id} = ${view_01777.account_id} ;;
    required_joins: [view_01776]
  }

  join: view_01778 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01774.category} = ${view_01778.category} ;;
  }

  access_filter: {
    field: view_01774.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01774.is_deleted} = false ;;
}
