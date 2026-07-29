# Explore: explore_0191
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00574.view.lkml"
include: "/views/domain_26/view_00576.view.lkml"
include: "/views/domain_27/view_00577.view.lkml"
include: "/views/domain_28/view_00578.view.lkml"

explore: explore_0191 {
  label: "Explore Explore 0191"
  description: "Comprehensive analytics explore joining base view_00574 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00574
  
  always_filter: {
    filters: [view_00574.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00574.created_at_date: "7 days"]
    unless: [view_00574.id, view_00574.status]
  }

  join: view_00576 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00574.user_id} = ${view_00576.id} ;;
    required_joins: []
  }

  join: view_00577 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00574.account_id} = ${view_00577.account_id} ;;
    required_joins: [view_00576]
  }

  join: view_00578 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00574.category} = ${view_00578.category} ;;
  }

  access_filter: {
    field: view_00574.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00574.is_deleted} = false ;;
}
