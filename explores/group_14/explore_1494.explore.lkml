# Explore: explore_1494
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04483.view.lkml"
include: "/views/domain_35/view_04485.view.lkml"
include: "/views/domain_36/view_04486.view.lkml"
include: "/views/domain_37/view_04487.view.lkml"

explore: explore_1494 {
  label: "Explore Explore 1494"
  description: "Comprehensive analytics explore joining base view_04483 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04483
  
  always_filter: {
    filters: [view_04483.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04483.created_at_date: "7 days"]
    unless: [view_04483.id, view_04483.status]
  }

  join: view_04485 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04483.user_id} = ${view_04485.id} ;;
    required_joins: []
  }

  join: view_04486 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04483.account_id} = ${view_04486.account_id} ;;
    required_joins: [view_04485]
  }

  join: view_04487 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04483.category} = ${view_04487.category} ;;
  }

  access_filter: {
    field: view_04483.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04483.is_deleted} = false ;;
}
