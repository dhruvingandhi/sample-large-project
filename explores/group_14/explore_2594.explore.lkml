# Explore: explore_2594
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07783.view.lkml"
include: "/views/domain_35/view_07785.view.lkml"
include: "/views/domain_36/view_07786.view.lkml"
include: "/views/domain_37/view_07787.view.lkml"

explore: explore_2594 {
  label: "Explore Explore 2594"
  description: "Comprehensive analytics explore joining base view_07783 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07783
  
  always_filter: {
    filters: [view_07783.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07783.created_at_date: "7 days"]
    unless: [view_07783.id, view_07783.status]
  }

  join: view_07785 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07783.user_id} = ${view_07785.id} ;;
    required_joins: []
  }

  join: view_07786 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07783.account_id} = ${view_07786.account_id} ;;
    required_joins: [view_07785]
  }

  join: view_07787 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07783.category} = ${view_07787.category} ;;
  }

  access_filter: {
    field: view_07783.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07783.is_deleted} = false ;;
}
