# Explore: explore_0648
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01945.view.lkml"
include: "/views/domain_47/view_01947.view.lkml"
include: "/views/domain_48/view_01948.view.lkml"
include: "/views/domain_49/view_01949.view.lkml"

explore: explore_0648 {
  label: "Explore Explore 0648"
  description: "Comprehensive analytics explore joining base view_01945 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01945
  
  always_filter: {
    filters: [view_01945.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01945.created_at_date: "7 days"]
    unless: [view_01945.id, view_01945.status]
  }

  join: view_01947 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01945.user_id} = ${view_01947.id} ;;
    required_joins: []
  }

  join: view_01948 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01945.account_id} = ${view_01948.account_id} ;;
    required_joins: [view_01947]
  }

  join: view_01949 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01945.category} = ${view_01949.category} ;;
  }

  access_filter: {
    field: view_01945.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01945.is_deleted} = false ;;
}
