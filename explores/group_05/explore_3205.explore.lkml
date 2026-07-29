# Explore: explore_3205
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09616.view.lkml"
include: "/views/domain_18/view_09618.view.lkml"
include: "/views/domain_19/view_09619.view.lkml"
include: "/views/domain_20/view_09620.view.lkml"

explore: explore_3205 {
  label: "Explore Explore 3205"
  description: "Comprehensive analytics explore joining base view_09616 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09616
  
  always_filter: {
    filters: [view_09616.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09616.created_at_date: "7 days"]
    unless: [view_09616.id, view_09616.status]
  }

  join: view_09618 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09616.user_id} = ${view_09618.id} ;;
    required_joins: []
  }

  join: view_09619 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09616.account_id} = ${view_09619.account_id} ;;
    required_joins: [view_09618]
  }

  join: view_09620 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09616.category} = ${view_09620.category} ;;
  }

  access_filter: {
    field: view_09616.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09616.is_deleted} = false ;;
}
