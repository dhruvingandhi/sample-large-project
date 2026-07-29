# Explore: explore_0214
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00643.view.lkml"
include: "/views/domain_45/view_00645.view.lkml"
include: "/views/domain_46/view_00646.view.lkml"
include: "/views/domain_47/view_00647.view.lkml"

explore: explore_0214 {
  label: "Explore Explore 0214"
  description: "Comprehensive analytics explore joining base view_00643 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00643
  
  always_filter: {
    filters: [view_00643.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00643.created_at_date: "7 days"]
    unless: [view_00643.id, view_00643.status]
  }

  join: view_00645 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00643.user_id} = ${view_00645.id} ;;
    required_joins: []
  }

  join: view_00646 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00643.account_id} = ${view_00646.account_id} ;;
    required_joins: [view_00645]
  }

  join: view_00647 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00643.category} = ${view_00647.category} ;;
  }

  access_filter: {
    field: view_00643.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00643.is_deleted} = false ;;
}
