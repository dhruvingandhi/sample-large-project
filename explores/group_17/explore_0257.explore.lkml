# Update for 2000 file diff target
# Explore: explore_0257
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00772.view.lkml"
include: "/views/domain_24/view_00774.view.lkml"
include: "/views/domain_25/view_00775.view.lkml"
include: "/views/domain_26/view_00776.view.lkml"

explore: explore_0257 {
  label: "Explore Explore 0257"
  description: "Comprehensive analytics explore joining base view_00772 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00772
  
  always_filter: {
    filters: [view_00772.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00772.created_at_date: "7 days"]
    unless: [view_00772.id, view_00772.status]
  }

  join: view_00774 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00772.user_id} = ${view_00774.id} ;;
    required_joins: []
  }

  join: view_00775 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00772.account_id} = ${view_00775.account_id} ;;
    required_joins: [view_00774]
  }

  join: view_00776 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00772.category} = ${view_00776.category} ;;
  }

  access_filter: {
    field: view_00772.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00772.is_deleted} = false ;;
}
