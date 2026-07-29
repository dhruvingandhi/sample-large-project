# Explore: explore_0145
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00436.view.lkml"
include: "/views/domain_38/view_00438.view.lkml"
include: "/views/domain_39/view_00439.view.lkml"
include: "/views/domain_40/view_00440.view.lkml"

explore: explore_0145 {
  label: "Explore Explore 0145"
  description: "Comprehensive analytics explore joining base view_00436 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00436
  
  always_filter: {
    filters: [view_00436.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00436.created_at_date: "7 days"]
    unless: [view_00436.id, view_00436.status]
  }

  join: view_00438 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00436.user_id} = ${view_00438.id} ;;
    required_joins: []
  }

  join: view_00439 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00436.account_id} = ${view_00439.account_id} ;;
    required_joins: [view_00438]
  }

  join: view_00440 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00436.category} = ${view_00440.category} ;;
  }

  access_filter: {
    field: view_00436.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00436.is_deleted} = false ;;
}
