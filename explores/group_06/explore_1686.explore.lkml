# Explore: explore_1686
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05059.view.lkml"
include: "/views/domain_11/view_05061.view.lkml"
include: "/views/domain_12/view_05062.view.lkml"
include: "/views/domain_13/view_05063.view.lkml"

explore: explore_1686 {
  label: "Explore Explore 1686"
  description: "Comprehensive analytics explore joining base view_05059 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05059
  
  always_filter: {
    filters: [view_05059.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05059.created_at_date: "7 days"]
    unless: [view_05059.id, view_05059.status]
  }

  join: view_05061 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05059.user_id} = ${view_05061.id} ;;
    required_joins: []
  }

  join: view_05062 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05059.account_id} = ${view_05062.account_id} ;;
    required_joins: [view_05061]
  }

  join: view_05063 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05059.category} = ${view_05063.category} ;;
  }

  access_filter: {
    field: view_05059.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05059.is_deleted} = false ;;
}
