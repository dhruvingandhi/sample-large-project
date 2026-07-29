# Explore: explore_1594
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04783.view.lkml"
include: "/views/domain_35/view_04785.view.lkml"
include: "/views/domain_36/view_04786.view.lkml"
include: "/views/domain_37/view_04787.view.lkml"

explore: explore_1594 {
  label: "Explore Explore 1594"
  description: "Comprehensive analytics explore joining base view_04783 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04783
  
  always_filter: {
    filters: [view_04783.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04783.created_at_date: "7 days"]
    unless: [view_04783.id, view_04783.status]
  }

  join: view_04785 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04783.user_id} = ${view_04785.id} ;;
    required_joins: []
  }

  join: view_04786 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04783.account_id} = ${view_04786.account_id} ;;
    required_joins: [view_04785]
  }

  join: view_04787 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04783.category} = ${view_04787.category} ;;
  }

  access_filter: {
    field: view_04783.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04783.is_deleted} = false ;;
}
