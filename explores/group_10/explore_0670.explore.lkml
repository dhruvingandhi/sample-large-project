# Explore: explore_0670
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02011.view.lkml"
include: "/views/domain_13/view_02013.view.lkml"
include: "/views/domain_14/view_02014.view.lkml"
include: "/views/domain_15/view_02015.view.lkml"

explore: explore_0670 {
  label: "Explore Explore 0670"
  description: "Comprehensive analytics explore joining base view_02011 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02011
  
  always_filter: {
    filters: [view_02011.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02011.created_at_date: "7 days"]
    unless: [view_02011.id, view_02011.status]
  }

  join: view_02013 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02011.user_id} = ${view_02013.id} ;;
    required_joins: []
  }

  join: view_02014 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02011.account_id} = ${view_02014.account_id} ;;
    required_joins: [view_02013]
  }

  join: view_02015 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02011.category} = ${view_02015.category} ;;
  }

  access_filter: {
    field: view_02011.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02011.is_deleted} = false ;;
}
