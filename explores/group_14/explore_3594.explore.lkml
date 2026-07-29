# Explore: explore_3594
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10783.view.lkml"
include: "/views/domain_35/view_10785.view.lkml"
include: "/views/domain_36/view_10786.view.lkml"
include: "/views/domain_37/view_10787.view.lkml"

explore: explore_3594 {
  label: "Explore Explore 3594"
  description: "Comprehensive analytics explore joining base view_10783 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10783
  
  always_filter: {
    filters: [view_10783.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10783.created_at_date: "7 days"]
    unless: [view_10783.id, view_10783.status]
  }

  join: view_10785 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10783.user_id} = ${view_10785.id} ;;
    required_joins: []
  }

  join: view_10786 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10783.account_id} = ${view_10786.account_id} ;;
    required_joins: [view_10785]
  }

  join: view_10787 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10783.category} = ${view_10787.category} ;;
  }

  access_filter: {
    field: view_10783.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10783.is_deleted} = false ;;
}
